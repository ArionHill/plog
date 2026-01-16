# Build sources (optional)
add_library(plog STATIC plog.cpp)
target_include_directories(plog PUBLIC ${PROJECT_SOURCE_DIR}/include)

target_compile_definitions(plog PUBLIC
  PLOG_VERSION_MAJOR=${PLOG_VERSION_MAJOR}
  PLOG_VERSION_MINOR=${PLOG_VERSION_MINOR}
  PLOG_VERSION_PATCH=${PLOG_VERSION_PATCH}
)

# Export headers from src/ to include/plog/
file(GLOB PLOG_SRC_HEADERS CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/*.h"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.hpp"
)
set(PLOG_EXPORTED_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include/plog")
if(PLOG_SRC_HEADERS)
    add_custom_target(plog_export_headers ALL
        COMMAND ${CMAKE_COMMAND} -E make_directory "${PLOG_EXPORTED_INCLUDE_DIR}"
        COMMAND ${CMAKE_COMMAND} -E copy_if_different ${PLOG_SRC_HEADERS} "${PLOG_EXPORTED_INCLUDE_DIR}"
        COMMENT "Exporting headers to ${PLOG_EXPORTED_INCLUDE_DIR}"
        VERBATIM
    )
else()
    add_custom_target(plog_export_headers ALL
        COMMAND ${CMAKE_COMMAND} -E make_directory "${PLOG_EXPORTED_INCLUDE_DIR}"
        COMMENT "No headers found in src/ to export"
        VERBATIM
    )
endif()
