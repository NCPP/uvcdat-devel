set(PYLIBXML2_MAJOR 2)
set(PYLIBXML2_MINOR 6)
set(PYLIBXML2_PATCH 9)
set(PYLIBXML2_MAJOR_SRC 2)
set(PYLIBXML2_MINOR_SRC 6)
set(PYLIBXML2_PATCH_SRC 9)
set(PYLIBXML2_URL ${LLNL_URL})
set(PYLIBXML2_GZ libxml2-python-${PYLIBXML2_MAJOR_SRC}.${PYLIBXML2_MINOR_SRC}.${PYLIBXML2_PATCH_SRC}.tar.gz)
set(PYLIBXML2_MD5 00bea8dda0e1c9f912f6c937b3dd2374 )
set(PYLIBXML2_SOURCE ${PYLIBXML2_URL}/${PYLIBXML2_GZ})

set (nm PYLIBXML2)
string(TOUPPER ${nm} uc_nm)
set(${uc_nm}_VERSION ${${nm}_MAJOR_SRC}.${${nm}_MINOR_SRC}.${${nm}_PATCH_SRC})
add_cdat_package(PYLIBXML2 "" "" "")
#set(PYLIBXML2 ${pkgconfig_pkg} ${python_pkg} )