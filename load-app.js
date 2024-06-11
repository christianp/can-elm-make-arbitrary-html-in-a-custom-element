class ElmHTMLElement extends HTMLElement {
  constructor() {
    super();
    this.attachShadow({mode:'open'});
  }
  static get observedAttributes() { return ['html'] };

  attributeChangedCallback(name, oldValue, newValue) {
    if(name == 'html') {
      this.html = newValue;
    }
  }

  set html(value) {
    this.shadowRoot.innerHTML = value;
  }
}
customElements.define('elm-html', ElmHTMLElement);

async function init_app() {
    const app = Elm.App.init({node: document.body, flags: {}});
}

init_app();
