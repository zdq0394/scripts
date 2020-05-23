#! /bin/bash
# args1: time in seconds to wait
# args2: message to show
function wait_for(){
    c=$1
    while [ $c -gt 0 ]
    do
    echo "$2: $c seconds left..."
    sleep 1
    let --c
    done
}
wait_for 5 "Integration Test"