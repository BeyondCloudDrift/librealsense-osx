if (NOT TARGET usb)
    find_library(LIBUSB_LIB usb-1.0 /Users/poet/codes/libusb/libusb-1.0.29/libs/lib)
    # find_path(LIBUSB_INC libusb.h libusb-1.0 /Users/poet/codes/libusb/libusb-1.0.29/libs/include HINTS PATH_SUFFIXES)
    find_path(LIBUSB_INC libusb.h
        HINTS /Users/poet/codes/libusb/libusb-1.0.29/libs/include
        PATH_SUFFIXES libusb-1.0
    )
    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(usb "libusb not found; using internal version" LIBUSB_LIB LIBUSB_INC)
    if (USB_FOUND AND NOT USE_EXTERNAL_USB)
        add_library(usb INTERFACE)
        target_include_directories(usb INTERFACE ${LIBUSB_INC})
        target_link_libraries(usb INTERFACE ${LIBUSB_LIB})
    else()
        include(CMake/external_libusb.cmake)
    endif()
    install(TARGETS usb EXPORT realsense2Targets)
endif()
