open Example.Lib

let test_then_some () =
  Alcotest.(check (option int))
    "converts true to Some with given value" (Some 3)
    (true |> Bool.then_some 3);
  Alcotest.(check (option int))
    "converts false to None" None
    (false |> Bool.then_some 3)

let test_ok_or () =
  Alcotest.(
    check (result int int) "converts Some to Ok" (Ok 3)
      (Some 3 |> Option.ok_or 4));
  Alcotest.(
    check (result int int) "converts None to Error with given value" (Error 4)
      (None |> Option.ok_or 4))

let () =
  Alcotest.run "Example.Lib"
    [
      ("Bool", [ Alcotest.test_case "then_some" `Quick test_then_some ]);
      ("Option", [ Alcotest.test_case "ok_or" `Quick test_ok_or ]);
    ]
