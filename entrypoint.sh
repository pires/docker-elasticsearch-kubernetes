#!/bin/bash

set -e

max_memory() {
    local memory_limit=$1
    local ratio=${JAVA_MAX_MEM_RATIO:-50}
    echo "${memory_limit} ${ratio} 1048576" | awk '{printf "%d\n" , ($1*$2)/(100*$3) + 0.5}'
}

set_jvm_heap_size() {
    # Check for container memory limits/request and use it to set JVM Heap size.
    # Defaults to 50% of the limit/request value.
    if [ -n "$MY_MEM_LIMIT" ]; then
        export JVM_HEAP_SIZE="$( max_memory $MY_MEM_LIMIT )"
    elif [ -n "$MY_MEM_REQUEST" ]; then
        export JVM_HEAP_SIZE="$( max_memory $MY_MEM_REQUEST )"
    fi

    if [ -z "$JVM_HEAP_SIZE" ]; then
        echo "Unable to detect reasonable JVM heap size, not configuring JVM heap size"
    else
        echo "Setting JVM_HEAP_SIZE to ${JVM_HEAP_SIZE}M"
    fi
}

set_set_es_java_opts() {
    if [ -z "$ES_JAVA_OPTS" ]; then
        echo "\$ES_JAVA_OPTS not set, setting JVM max heap size"
        set_jvm_heap_size
        export ES_JAVA_OPTS="$ES_JAVA_OPTS -Xmx${JVM_HEAP_SIZE}m"
    elif [[ ! "$ES_JAVA_OPTS" =~ "-Xmx" ]]; then
        echo "\$ES_JAVA_OPTS set, but no JVM max heap size flag set, setting JVM max heap size"
        set_jvm_heap_size
        export ES_JAVA_OPTS="$ES_JAVA_OPTS -Xmx${JVM_HEAP_SIZE}m"
    elif [[ "$ES_JAVA_OPTS" =~ "-Xmx" ]] && [ "$OVERWRITE_JVM_HEAPSIZE" == "true" ]; then
        echo "\$ES_JAVA_OPTS set and JVM max heapsize already configured, but \$OVERWRITE_JVM_HEAPSIZE=true, setting JVM max heap size"
        set_jvm_heap_size
        export ES_JAVA_OPTS="${ES_JAVA_OPTS//-Xmx+([[:digit:]])[a-z]/-Xmx${JVM_HEAP_SIZE}m}"
    else
        echo "Not setting JVM max heap size, already set"
    fi
}

set_set_es_java_opts
exec "$@"
