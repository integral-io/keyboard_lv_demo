defmodule KeyboardLvDemoWeb.BoardLive do
  use KeyboardLvDemoWeb, :live_view

  @qwerty_order ~w(q w e r t y)

  def mount(_params, _session, socket) do
    keys_pressed = MapSet.new()

    {:ok,
     assign(socket,
       keys_pressed: keys_pressed,
       keys: @qwerty_order
     )}
  end

  def render(assigns) do
    ~H"""
    <div phx-window-keydown="key_down">
      <%= for letter <- @keys do %>
        <.key_block key={letter} key_pressed?={MapSet.member?(@keys_pressed, letter)}/>
      <% end %>
    </div>
    """
  end

  def handle_event("key_down", %{"key" => key}, socket) do
    socket =
      assign(socket,
        keys_pressed: MapSet.put(socket.assigns.keys_pressed, key)
      )

    {:noreply, socket}
  end

  defp key_block(assigns) do
    background =
      if assigns.key_pressed? do
        "bg-blue-400"
      else
        ""
      end

    class = "inline-block m-4 py-2 px-4 border-2 border-black #{background}"
    assigns = update(assigns, :key, &String.upcase/1)

    ~H"""
    <div class={class}><%= @key %></div>
    """
  end
end
