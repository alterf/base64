dropFile = (e) ->
    e.stopPropagation()
    e.preventDefault()

    files = e.dataTransfer.files
    for i in [0..files.length - 1]
        console.log(files[i])

        reader = new FileReader()
        reader.onload = ((file) ->
            return (e) ->
                elem = document.createElement('span')
                elem.innerHTML = '<li>' +
                        '<img class="fileImage" src="' + e.target.result + '">'+
                        '<ul class="fileInfo">'+
                            '<li class="fileName">' + file.name + '</li>'+
                            '<li class="fileSize">' + file.size + '</li>'+
                            '<li class="fileBase64">'+
                                '<input type="text" class="copyText" value="' + e.target.result + '">'+
                            '</li>'+
                        '</ul>'+
                    '</li>'
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
