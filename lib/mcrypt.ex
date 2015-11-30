defmodule Mcrypt do
  @on_load :init

  def init do
    path = :filename.join(:code.priv_dir(:mcrypt), 'lib_mcrypt')
    :ok  = :erlang.load_nif(path, 1)
  end

  # A simple wrapper around the NIF call
  def hello do
    _hello
  end

  # This function will not be overwritten if the nif fails to load
  def _hello do
    exit(:nif_library_not_loaded)
  end
end
