let regularExpression = [%bs.re "/^[6-9]\d{9}$/"];

let isInvalid = (allowBlank, number) =>
  if (number |> String.trim |> String.length > 0) {
    !(number |> Js.Re.test_(regularExpression));
  } else {
    !allowBlank;
  };
