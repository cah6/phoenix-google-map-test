defmodule ApertivoWeb.HappyHourLive.Show do
  use ApertivoWeb, :live_view

  alias Apertivo.HappyHours

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:happy_hour, HappyHours.get_happy_hour!(id))}
  end

  defp page_title(:show), do: "Show Happy hour"
  defp page_title(:edit), do: "Edit Happy hour"
end
