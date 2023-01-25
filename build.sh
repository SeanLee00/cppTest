if [ -z $BASH_SOURCE ]; then
    SOURCE=${0}
else
    SOURCE=${BASH_SOURCE}
fi

TOP="$(realpath $(dirname $(readlink -f ${SOURCE})))"

NUM_CORES="$( nproc )"

# Note: If deprecated partition and flags have been removed, use this.
function build_and_install_ccos_with_cmake() {
    ARGS=("$@")
    PROJECT=${ARGS[@]:0:1}
    PARAMS=${ARGS[@]:1:$#}

    echo "[$PROJECT]Configure"
    echo ${SOURCE}
    echo $TOP/build/$PROJECT
    mkdir -p $TOP/build/$PROJECT
    cd $TOP/build/$PROJECT
    # NEWPWD=$PWD

    cmake $TOP/$PROJECT
    echo "[$PROJECT]Compile"
    make -j$NUM_CORES
    # echo "[$PROJECT]Install" && \
    make install

    R=$?

    # [ $OLDPWD = $NEWPWD ] || cd -
    # unset NEWPWD
    cd $TOP
    return $R
}
