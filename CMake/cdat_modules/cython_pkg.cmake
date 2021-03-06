set(CYTHON_MAJOR 0)
set(CYTHON_MINOR 16)
set(CYTHON_VERSION ${CYTHON_MAJOR}.${CYTHON_MINOR})
set(CYTHON_URL ${LLNL_URL} )
set(CYTHON_GZ Cython-${CYTHON_VERSION}.tar.gz)
set(CYTHON_MD5 79d33d53db4e0c5e9a7871ccec6cde2c )
set(CYTHON_SOURCE ${CYTHON_URL}/${CYTHON_GZ})

add_cdat_package_dependent(Cython "" "" ON "CDAT_BUILD_WO_ESGF" OFF)
