dropFile = (e) ->
    e.stopPropagation()
    e.preventDefault()

    getImageSize = (e) ->
        image = new Image()
        image.src = e.target.result
        return image



    files = e.dataTransfer.files
    for i in [0..files.length - 1]
        console.log(files[i])

        reader = new FileReader()
        reader.onload = ((file) ->
            return (e) ->
                elem = document.createElement('li')
                elem.className = 'imageElem'
                image = getImageSize(e)
                console.log(image)
                elem.innerHTML = '<img class="fileImage" src="' + e.target.result + '">' +
                        '<ul class="fileInfo">' +
                            '<li class="fileName">' + file.name + '</li>' +
                            '<li class="fileSize">' + file.size + '(Byte)</li>' +
                            '<li class="imageWidth">Width: ' + image.width + ' (px)  height: ' + image.height + ' (px)</li>' +
                            '<li class="imageWidth">css: background-size: ' + (+image.width / 2) + 'px ' + (image.height / 2) + 'px;</li>' +
                            '<li class="fileBase64">' +
                                '<input type="text" class="copyText" value="' + e.target.result + '">' +
                            '</li>' +
                        '</ul>'
                document.getElementById('result').insertBefore(elem, null)
                return
        )(files[i])
        reader.readAsDataURL(files[i])
    return;


fileOver = (e) ->
    e.stopPropagation()
    e.preventDefault()

    e.dataTransfer.dropEffect = 'copy'
    return

window.addEventListener('drop', dropFile, false)
window.addEventListener('dragover', fileOver, false)

