exception DataElementMissing(string);
exception RootElementMissing(string);
exception RootAttributeMissing(string);

open Webapi.Dom;

let parseJSONTag = (~id="react-root-data", ()) =>
  (
    switch (document |> Document.getElementById(id)) {
    | Some(rootElement) => rootElement |> Element.innerHTML
    | None => raise(DataElementMissing(id))
    }
  )
  |> Json.parseOrRaise;

let redirect = path => path |> Webapi.Dom.Window.setLocation(window);
