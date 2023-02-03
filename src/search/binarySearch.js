const { generateArrayOfNumber } = require('../helpers/generator')

const N = 4
const array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]

function sort(a,b) {
  return a - b
}

function getMidpoint(array) {
  const length = array.length - 2
  const midpoint = length % 2 === 0
    ? length / 2
    : (length - 1) / 2

  return midpoint
}

// function recursive(firstHalf,secondHalf,index) {
//   const a = firstHalf.at(-1)
//   const b = secondHalf[0]

//   if (N < a) {
//     const midpoint = getMidpoint(firstHalf) + 1
//     const first = firstHalf.slice(0,midpoint)
//     const second = firstHalf.slice(midpoint)

//     recursive(first,second,index)

//   } else if (N > b) {
//     const midpoint = getMidpoint(secondHalf) + 1
//     const first = secondHalf.slice(0,midpoint)
//     const second = secondHalf.slice(midpoint)
//     const i = index + firstHalf.length

//     console.log(`current index ${index} \t length: ${firstHalf.length}`)
//     recursive(first,second,i)

//   } else if (N === a) {
//     console.log(`final index: ${index}`)
//     return

//   } else if (N === b) {
//     console.log(`final index: ${index}`)
//     return

//   } else {
//     console.log('Element not found')
//     return
//   }
// }

function search(array, N, index) {
  let midpoint = getMidpoint(array)
  const element = array[midpoint]

  if (N < element) {
    midf

  } else if (N > element) {


  }
}


const min = 0
const midpoint = getMidpoint(array)
const leftArray = array.slice(min,(midpoint + 1))
const rightArray = array.slice((midpoint + 1))

console.table(array)
console.time('Runtime')

search(leftArray,rightArray,1)

console.timeEnd('Runtime')