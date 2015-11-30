defmodule Mcrypt do
  @on_load :init

  def init do
    path = :filename.join(:code.priv_dir(:mcrypt), 'lib_mcrypt')
    :ok  = :erlang.load_nif(path, 1)
  end

  # This function will not be overwritten if the nif fails to load
  def encrypt(_plaintext, _algorithm, _mode, _key, _iv) do
    exit(:nif_library_not_loaded)
  end

  def decrypt(_ciphertext, _algorithm, _mode, _key, _iv) do
    exit(:nif_library_not_loaded)
  end
end
