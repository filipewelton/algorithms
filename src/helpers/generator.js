function generateRandomNumber(min,max) {
  const randomNumber = Math.floor(Math.random() * (max - min)) + min
  return randomNumber
}

function generateArrayOfNumber(range,seed) {
  const numbers = []
  const max = range * 10

  for (let i = 0; i < range; i++) {
    const number = generateRandomNumber(1,max)
    numbers.push(number)
  }

  const indexSeed = generateRandomNumber(0, range)
  numbers[indexSeed] = seed

  return numbers
}

module.exports = { generateArrayOfNumber }