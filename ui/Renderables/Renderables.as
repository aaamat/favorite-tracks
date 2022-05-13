interface IRenderable
{
	void Render();
	bool IsVisible();	
}

namespace Renderables
{
	array<IRenderable@> g_renderables;

	void Add(IRenderable@ rend)
	{
		g_renderables.InsertLast(rend);
	}

	void Render()
	{
		for (int i = int(g_renderables.Length) - 1; i >= 0; i--) {
			auto rend = g_renderables[i];
			rend.Render();
			/* When the Window is closed it wont be rendered at all */
			if (!rend.IsVisible()) {
				g_renderables.RemoveAt(i);
			}
		}
	}
}