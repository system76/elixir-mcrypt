defmodule McryptTest do
  use ExUnit.Case
  doctest Mcrypt

  @plaintext "Hello, World!"
  @ciphertext <<155, 241, 126, 100, 201, 99, 156, 200, 237, 54, 23, 212, 153>>
  @key "abcdefghijklmnopqrstuvwxyz012345"
  @iv <<62, 9, 192, 172, 116, 137, 208, 6, 250, 199, 117, 47, 177, 123, 252, 87,
    121, 33, 30, 181, 190, 216, 238, 57, 36, 222, 35, 23, 65, 78, 184, 233>>

  test "encrypting matches a known ciphertext" do
    assert Mcrypt.encrypt(@plaintext, :rijndael_256, :nofb, @key, @iv) == {:ok, @ciphertext}
  end

  test "decrypting a known ciphertext reproduces the plaintext" do
    assert Mcrypt.decrypt(@ciphertext, :rijndael_256, :nofb, @key, @iv) == {:ok, @plaintext}
  end
end
