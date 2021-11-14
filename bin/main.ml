open Batteries
open Example.Lib

let () =
  1 -- 999
  |> Enum.filter (fun i -> i mod 3 = 0 || i mod 5 = 0)
  |> Enum.reduce ( + ) |> Int.print stdout;
  print_newline ();

  let even x = x mod 2 = 0 in
  Unix.time () |> int_of_float |> even |> Bool.then_some "Foo"
  |> Option.ok_or "Bar"
  |> function
  | Ok v -> print_endline v
  | Error v -> print_endline v
