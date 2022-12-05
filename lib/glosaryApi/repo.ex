defmodule GlosaryApi.Repo do
  use Ecto.Repo,
    otp_app: :glosaryApi,
    adapter: Ecto.Adapters.Postgres
end
