function StrictType(/* args... */) {
    if (arguments.length == 0) {
        console.error('StrictType needs arguments.');
    }
    console.log(arguments);
}
