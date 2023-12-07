// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.querySelector('.menu-toggle').addEventListener('click', function() {
  document.querySelector('.menuItems').classList.toggle('active');
});

// ——————————————————————————————————————————————————
// TextScramble
// ——————————————————————————————————————————————————

class TextScramble {
  constructor(el) {
    this.el = el
    this.chars = '!<>-_\\/[]{}—=+*^?#________'
    this.update = this.update.bind(this)
  }



  setText(newText) {
    const oldText = this.el.innerText
    const length = Math.max(oldText.length, newText.length)
    const promise = new Promise((resolve) => this.resolve = resolve)
    this.queue = []
    for (let i = 0; i < length; i++) {
      const from = oldText[i] || ''
      const to = newText[i] || ''
      const start = Math.floor(Math.random() * 40)
      const end = start + Math.floor(Math.random() * 40)
      this.queue.push({ from, to, start, end })
    }
    cancelAnimationFrame(this.frameRequest)
    this.frame = 0
    this.update()
    return promise
  }
  update() {
    let output = ''
    let complete = 0
    for (let i = 0, n = this.queue.length; i < n; i++) {
      let { from, to, start, end, char } = this.queue[i]
      if (this.frame >= end) {
        complete++
        output += to
      } else if (this.frame >= start) {
        if (!char || Math.random() < 0.28) {
          char = this.randomChar()
          this.queue[i].char = char
        }
        output += `<span class="dud">${char}</span>`
      } else {
        output += from
      }
    }
    this.el.innerHTML = output
    if (complete === this.queue.length) {
      this.resolve()
    } else {
      this.frameRequest = requestAnimationFrame(this.update)
      this.frame++
    }
  }
  randomChar() {
    return this.chars[Math.floor(Math.random() * this.chars.length)]
  }
}

// ——————————————————————————————————————————————————
// Example
// ——————————————————————————————————————————————————

const phrases = [
  'Mes Projets Webs',
  'Ici',
  'Vous pourrez trouver',
  'Mon CV',
  'Mes projets en cours,',
  'Même si more are coming',
  'Je vous invite',
  'à prendre contact avec moi',
  'Si vous avez besoin d\'un service web',
  'Cliquez simplement ici',
  'Oui oui, juste là'
]

const hello = [
  'Hello',
  'Hi',
  'Bonjour',
  'Hello World',
  'Guten Tag',
  'Holà',
  'ní zǎo',
  'Dobro jutro',
  'Kaliméra',
  'dhaoibh ',
  'Ohayō gozaimasu',
  'Sabah el kheir',
  'Habari ya asubuhi',
  'Chào',
  'Buongiorno'
]

const hop = document.querySelector('.hello')
const hoped = new TextScramble(hop)

const el = document.querySelector('.text-js')
const fx = new TextScramble(el)



let counter = 0
let newCounter = 0

const next = () => {
  fx.setText(phrases[counter]).then(() => {
    setTimeout(next, 900)
  })
  counter = (counter + 1) % phrases.length
}

const nextF = () => {
  hoped.setText(hello[newCounter]).then(() => {
    setTimeout(nextF, 500)
  })
  newCounter = (newCounter + 1) % hello.length
}

next()
nextF()
