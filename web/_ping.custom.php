<?php
echo '------------------------------------';
debug_print_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS);
$e = new Exception;
$aa = var_export($e->getTraceAsString(), true);
print $aa;