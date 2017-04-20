defmodule Coherence.Invitation do
  @moduledoc """
  Schema to support inviting a someone to create an account.
  """
  use Coherence.Web, :model

  schema "invitations" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :token, :string

    timestamps()
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  @spec changeset(Ecto.Schema.t, Map.t) :: Ecto.Changeset.t
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, ~w(first_name last_name email token))
    |> validate_required([:first_name, :last_name, :email])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
  end
end
