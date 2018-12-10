if [ -z "$1" ]; then
    echo "! Provide release name as an argument"
    helm list --all
    exit 1;
fi

if [ $2 ]; then
    NAMESPACE=$2
else
  # Get the namespace from the helm chart
  NAMESPACE=`helm ls | grep $1 | cut -f -1`
fi

if [ $NAMESPACE ]; then

    echo "* Deleting release"
    helm delete --purge $1

    echo "* Removing all resources tagged with this release"
    kubectl delete all -l release=$1 -n $NAMESPACE --grace-period=0

    echo "* Doublecheck and remove the leftover resources"
    for type in deployment cronjob statefulset job pod pvc pv
    do
	echo $type ...
	#kubectl get $type --namespace=$NAMESPACE | grep $1
	#echo $(kubectl get $type -o custom-columns=:.metadata.name --namespace=$NAMESPACE | grep $1)
        for resource in $(kubectl get $type -o custom-columns=:.metadata.name --namespace $NAMESPACE | grep $1);
	do
	    echo Removing $type $resource
	    kubectl delete $type $resource --namespace=$NAMESPACE --grace-period=0
	done
    done

else
  echo "! No namespace could be found, provide it a as a parameter."
fi
