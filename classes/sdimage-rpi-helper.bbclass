IMAGE_CMD_wic_append () {
	mv "$out${IMAGE_NAME_SUFFIX}.wic" "$out${IMAGE_NAME_SUFFIX}.sdcard"
	ln -fs "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.sdcard" "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.sdcard"
}
