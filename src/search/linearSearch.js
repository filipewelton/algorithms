const { generateArrayOfNumber } = require('../helpers/generator')

const wanted = 100
const array = generateArrayOfNumber(100, wanted)

function recursive(array, wanted) {
  const currentElement = array[0]

  if (wanted === currentElement) {
    return 'Element found'
  }

  const newArray = array.slice(1)
  
  if (newArray.length === 0) {
    return 'Element not found'
  }

  return recursive(newArray, wanted)
}

console.time('Duration')
const reply = recursive(array, wanted)
console.log(reply)
console.timeEnd('Duration')