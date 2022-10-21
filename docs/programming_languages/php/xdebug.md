# xdebug

* php ini config:
```
zend_extension="xdebug.so"
xdebug.mode=trace,profile
xdebug.trace_format=0
xdebug.output_dir=<folder_path>
xdebug.auto_trace=1
xdebug.collect_assignments=true
xdebug.collect_return=true
xdebug.collect_params=3
xdebug.trace_output_name=timestamp
xdebug.start_with_request=yes
xdebug.var_display_max_depth=6
xdebug.var_display_max_data=1024
xdebug.var_display_max_children=512
```