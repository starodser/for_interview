window.onload = function () {
  const data = {
    x: generator(6, 9),
    y: generator(2, 8),
    z: function () {
      this.z = this.x + this.y
      return this.z
    }
  }
  function generator (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min
  }
  data.z()
  function validator () {
    let z = data.z, x = data.x, y = data.y
    while (z < 11 || z > 14) {
      y = generator (2, 8)
      z = x + y
    } return data.y = y,
             data.z = z
  }
   validator(data)

  const example = document.querySelector("h3")
  example.innerHTML=`${data.x} + ${data.y} = ?`
  const canvas = document.getElementById('can').getContext('2d')
  const img = new Image();
  const divFront = document.querySelector(".front")
  const input = document.createElement('input')
  input.style.width = "20px"
  input.style.height ="20px"
  input.style.left = (data.x * 39 + 44) /2 + "px"
  input.style.top = "240px"
  const input1 = document.createElement('input')
  input1.style.width = "20px"
  input1.style.height = "20px"
  input1.style.top = "240px"
  input1.style.left = (data.x * 39 + 44 + data.y * 39 * 0.5 - 10) + "px"
  const input2 = document.createElement('input')
  input2.style.width = "50px"
  input2.style.height = "40px"
  input2.style.top = "43px"
  input2.style.left = "500px"
  divFront.appendChild(input)
  input.addEventListener('input', function() {
    if (input.value == data.x) {
      input.style.color = "black"
      canvas.clearRect(357, 42, 43, 56)
      input.style.visibility = "hidden"
      const numberX = document.createElement('h4')
      numberX.innerHTML = data.x
      numberX.style.left = (data.x * 39 + 44) /2 + "px"
      numberX.style.top = "210px"
      divFront.appendChild(numberX)
      arrrow2()
      divFront.appendChild(input1)
    } else {
        input.style.color = "red"
        canvas.fillStyle = "orange";
        canvas.fillRect(357, 42, 43, 56);
        }
    })
  input1.addEventListener('input', function() {
    if (input1.value == data.y) {
      input.style.color = "black"
      canvas.clearRect(428, 42, 43, 56)
      input1.style.visibility = "hidden"
      const numberY = document.createElement('h4')
      numberY.innerHTML = data.y
      numberY.style.left = ( data.x * 39 + 44 + data.y * 39 * 0.5 - 10) + "px"
      numberY.style.top = "210px"
      divFront.appendChild(numberY)
      divFront.appendChild(input2)
    } else {
        input1.style.color = "red"
        canvas.fillStyle = "orange";
        canvas.fillRect(428, 42, 43, 56);
    }
  })
  input2.addEventListener('input', function() {
    if (input2.value == data.z) {
      input2.style.visibility = "hidden"
      example.innerHTML = `${data.x} + ${data.y} = ${data.z}`
    } else {
      input2.style.color = "red"
    }
  })
  img.addEventListener('load', function(
  ) {
    let basisY = 310 ;
    let startX = 44 ;
    let endX = data.x*39 + startX
    let middle = (endX )/2
    canvas.drawImage(img, 10, 300 )
    canvas.moveTo(endX -8, basisY -1)
    canvas.lineTo(endX, basisY)
    canvas.lineTo(endX -5, basisY -4)
    canvas.lineWidth = 2;
    canvas.strokeStyle = "purple";
    canvas.stroke()
    canvas.beginPath();
    canvas.moveTo(startX, basisY);
    canvas.quadraticCurveTo(middle, 235, endX, basisY);
    canvas.lineWidth = 3;
    canvas.strokeStyle = "purple";
    canvas.stroke();

   }, false)
  img.src = 'sprite.png'
  function arrrow2 () {
    img.addEventListener('load', function(
    ) {
      let basisY = 310 ;
      let startX = 44 ;
      let endX = data.x * 39 + startX
      let middle = (endX )/2
      let endX1 = endX + data.y * 39
      let middle1 = (endX1 - endX)/2 + endX
      canvas.drawImage(img, 10, 300 )
      canvas.moveTo(endX - 8, basisY - 1)
      canvas.lineTo(endX, basisY)
      canvas.lineTo(endX - 5, basisY - 4)
      canvas.lineWidth = 2;
      canvas.strokeStyle = "purple";
      canvas.stroke()
      canvas.beginPath();
      canvas.moveTo(startX, basisY);
      canvas.quadraticCurveTo(middle, 235, endX, basisY);
      canvas.lineWidth = 3;
      canvas.strokeStyle = "purple";
      canvas.stroke();
      canvas.moveTo(endX1 - 8, basisY - 1)
      canvas.lineTo(endX1, basisY)
      canvas.lineTo(endX1 - 5, basisY - 4)
      canvas.lineWidth = 2;
      canvas.strokeStyle = "purple";
      canvas.stroke()
      canvas.beginPath();
      canvas.moveTo(endX, basisY);
      canvas.quadraticCurveTo(middle1, 235, endX1, basisY);
      canvas.lineWidth = 3;
      canvas.strokeStyle = "purple";
      canvas.stroke();
  },false)
  img.src = 'sprite.png'
  }
}
