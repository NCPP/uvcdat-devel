
set(tcl_source "${CMAKE_CURRENT_BINARY_DIR}/build/tcl")
set(tk_source "${CMAKE_CURRENT_BINARY_DIR}/build/tk")
set(tcltk_install "${cdat_EXTERNALS}")


# tcl
#
set(proj tcl-${TCLTK_MAJOR}.${TCLTK_MINOR})

# Build dir is different for apple
if (APPLE)
    set(SUBTKDIR macosx)
    set(tcltk_configure_args --enable-aqua)
    set(ENV_ARGS "env PREFIX=${cdat_EXTERNALS} INSTALL_PATH=${cdat_EXTERNALS}/Library/Frameworks")
else()
    set(SUBTKDIR unix)
    set(tcltk_configure_args --enable-shared)
endif()
message([INFO] SUBTKDIR IS: ${SUBTKDIR})

ExternalProject_Add(${proj}
  DOWNLOAD_DIR ${CDAT_PACKAGE_CACHE_DIR}
  SOURCE_DIR ${tcl_source}
  INSTALL_DIR ${tcltk_install}
  URL ${TCLTK_URL}/${TCL_GZ}
  URL_MD5 ${TCL_MD5}
  BUILD_IN_SOURCE 1
  WORKING_DIR ${tcl_source}/macosx
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -DINSTALL_DIR=<INSTALL_DIR> -DWORKING_DIR=<SOURCE_DIR>/${SUBTKDIR} -DENV_ARGS=${ENV_ARGS} -P ${cdat_CMAKE_BINARY_DIR}/cdat_configure_step.cmake
  BUILD_COMMAND ${CMAKE_COMMAND} -DENV_ARGS=${ENV_ARGS} -Dmake=$(MAKE) -DWORKING_DIR=<SOURCE_DIR>/${SUBTKDIR} -P ${cdat_CMAKE_BINARY_DIR}/cdat_make_step.cmake
  INSTALL_COMMAND ${CMAKE_COMMAND} -DENV_ARGS=${ENV_ARGS} -DWORKING_DIR=<SOURCE_DIR>/${SUBTKDIR} -P ${cdat_CMAKE_BINARY_DIR}/cdat_install_step.cmake
  DEPENDS ${TclTk_deps}
  ${ep_log_options}
)

# tk
#
set(proj tk-${TCLTK_MAJOR}.${TCLTK_MINOR})

ExternalProject_Add(${proj}
  DOWNLOAD_DIR ${CDAT_PACKAGE_CACHE_DIR}
  SOURCE_DIR ${tk_source}
  INSTALL_DIR ${tcltk_install}
  URL ${TCLTK_URL}/${TK_GZ}
  URL_MD5 ${TK_MD5}
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -DINSTALL_DIR=<INSTALL_DIR> -DWORKING_DIR=<SOURCE_DIR>/${SUBTKDIR} -P ${cdat_CMAKE_BINARY_DIR}/cdat_configure_step.cmake
  BUILD_COMMAND ${CMAKE_COMMAND} -Dmake=$(MAKE) -DWORKING_DIR=<SOURCE_DIR>/${SUBTKDIR} -P ${cdat_CMAKE_BINARY_DIR}/cdat_make_step.cmake
  INSTALL_COMMAND ${CMAKE_COMMAND} -DWORKING_DIR=<SOURCE_DIR>/${SUBTKDIR} -P ${cdat_CMAKE_BINARY_DIR}/cdat_install_step.cmake
  DEPENDS tcl-${TCLTK_MAJOR}.${TCLTK_MINOR}
  ${ep_log_options}
)

ExternalProject_Add_Step(${proj} symlink
  COMMAND ${CMAKE_COMMAND} -E create_symlink "wish${TCLTK_MAJOR}.${TCLTK_MINOR}" wish
  WORKING_DIRECTORY ${tcltk_install}/bin
  COMMENT "Linking wish${TCLTK_MAJOR}.${TCLTK_MINOR} to wish"
  DEPENDEES install
)

# tcltk
#

ExternalProject_Add(TclTk
  DOWNLOAD_COMMAND ""
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  DEPENDS tk-${TCLTK_MAJOR}.${TCLTK_MINOR}
  ${ep_log_options}
)

