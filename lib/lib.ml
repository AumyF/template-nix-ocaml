module Bool = struct
  include Bool

  let then_some v = function true -> Some v | false -> None
end

module Option = struct
  include Option

  let ok_or e = function Some v -> Ok v | None -> Error e
end
