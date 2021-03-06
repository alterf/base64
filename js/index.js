// Generated by CoffeeScript 1.7.1
(function() {
  var dropFile, fileOver, selectAll;

  dropFile = function(e) {
    var files, getImageSize, i, reader, _i, _ref;
    e.stopPropagation();
    e.preventDefault();
    getImageSize = function(e) {
      var image;
      image = new Image();
      image.src = e.target.result;
      return image;
    };
    files = e.dataTransfer.files;
    for (i = _i = 0, _ref = files.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
      console.log(files[i]);
      reader = new FileReader();
      reader.onload = (function(file) {
        return function(e) {
          var elem, image;
          elem = document.createElement('li');
          elem.className = 'imageElem';
          image = getImageSize(e);
          console.log(image);
          elem.innerHTML = '<img class="fileImage" src="' + e.target.result + '">' + '<ul class="fileInfo">' + '<li class="fileName">' + file.name + '</li>' + '<li class="fileSize">' + file.size + '(Byte) / base64Size' + e.target.result.length + '(byte)</li>' + '<li class="imageWidth">Width: ' + image.width + ' (px)  height: ' + image.height + ' (px)</li>' + '<li class="imageWidth">css: background-size: ' + (+image.width / 2) + 'px ' + (image.height / 2) + 'px;</li>' + '<li class="fileBase64">' + '<input type="text" readonly class="copyText" value="' + e.target.result + '">' + '</li>' + '</ul>';
          document.getElementById('result').insertBefore(elem, null);
        };
      })(files[i]);
      reader.readAsDataURL(files[i]);
    }
  };

  fileOver = function(e) {
    e.stopPropagation();
    e.preventDefault();
    e.dataTransfer.dropEffect = 'copy';
  };

  selectAll = function(e) {};

  window.addEventListener('drop', dropFile, false);

  window.addEventListener('dragover', fileOver, false);

  window.addEventListener('focus', selectAll, false);

}).call(this);
