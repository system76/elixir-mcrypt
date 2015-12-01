defmodule Mcrypt do
  @on_load :init

  def init do
    path = :filename.join(:code.priv_dir(:mcrypt), 'lib_mcrypt')
    :ok  = :erlang.load_nif(path, 1)
  end

  # cast-128 (16): cbc cfb ctr ecb ncfb nofb ofb
  # gost (32): cbc cfb ctr ecb ncfb nofb ofb
  # rijndael-128 (32): cbc cfb ctr ecb ncfb nofb ofb
  # twofish (32): cbc cfb ctr ecb ncfb nofb ofb
  # arcfour (256): stream
  # cast-256 (32): cbc cfb ctr ecb ncfb nofb ofb
  # loki97 (32): cbc cfb ctr ecb ncfb nofb ofb
  # rijndael-192 (32): cbc cfb ctr ecb ncfb nofb ofb
  # saferplus (32): cbc cfb ctr ecb ncfb nofb ofb
  # wake (32): stream
  # blowfish-compat (56): cbc cfb ctr ecb ncfb nofb ofb
  # des (8): cbc cfb ctr ecb ncfb nofb ofb
  # rijndael-256 (32): cbc cfb ctr ecb ncfb nofb ofb
  # serpent (32): cbc cfb ctr ecb ncfb nofb ofb
  # xtea (16): cbc cfb ctr ecb ncfb nofb ofb
  # blowfish (56): cbc cfb ctr ecb ncfb nofb ofb
  # enigma (13): stream
  # rc2 (128): cbc cfb ctr ecb ncfb nofb ofb
  # tripledes (24): cbc cfb ctr ecb ncfb nofb ofb

  # This function will not be overwritten if the nif fails to load
  def encrypt(_plaintext, _algorithm, _mode, _key, _iv) do
    exit(:nif_library_not_loaded)
  end

  def decrypt(_ciphertext, _algorithm, _mode, _key, _iv) do
    exit(:nif_library_not_loaded)
  end

  # def key_length(:cast_128), do: 16
  # def key_length(:gost), do: 32
  # def key_length(:rijndael_128), do: 32
  # def key_length(:twofish), do: 32
  # def key_length(:arcfour), do: 256
  # def key_length(:cast_256), do: 32
  # def key_length(:loki97), do: 32
  # def key_length(:rijndael_192), do: 32
  # def key_length(:saferplus), do: 32
  # def key_length(:wake), do: 32
  # def key_length(:blowfish_compat), do: 56
  # def key_length(:des), do: 8
  # def key_length(:rijndael_256), do: 32
  # def key_length(:serpent), do: 32
  # def key_length(:xtea), do: 16
  # def key_length(:blowfish), do: 56
  # def key_length(:enigma), do: 13
  # def key_length(:rc2), do: 128
  # def key_length(:tripledes), do: 24
end
