const pay = () => {
  Payjp.setPublicKey("pk_test_5601d058687650fd8776c547");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shopping[number]"),
      cvc: formData.get("shopping[cvc]"),
      exp_month: formData.get("shopping[exp_month]"),
      exp_year: `20${formData.get("shopping[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

      }

      document.getElementById("shopping_number").removeAttribute("name");
      document.getElementById("shopping_cvc").removeAttribute("name");
      document.getElementById("shopping_exp_month").removeAttribute("name");
      document.getElementById("shopping_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);

