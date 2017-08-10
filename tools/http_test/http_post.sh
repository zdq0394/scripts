#! /bin/sh
curl -d "component=test&region=default&resource_id=1&resource_ns=test&resource_name=myfirstapp&resource_type=KEApp&operation_id=ODI100001&event_type=delete" http://127.0.0.1:8080/v1/log/ops/events

