using LuaFramework;
using LuaInterface;
using System.Reflection;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class DropMe : MonoBehaviour, IDropHandler, IPointerEnterHandler, IPointerExitHandler
{
	private Image containerImage;
	private Image receivingImage;
	private Color normalColor;
	public Color highlightColor = Color.yellow;
    public LuaFunction luafunc = null;

	public void OnEnable ()
	{
        containerImage = transform.GetComponent<Image>();
        receivingImage = transform.FindChild("Image").GetComponent<Image>();
		if (containerImage != null)
			normalColor = containerImage.color;
	}
	
	public void OnDrop(PointerEventData data)
	{
		containerImage.color = normalColor;
		
		if (receivingImage == null)
			return;
		
		Sprite dropSprite = GetDropSprite (data);
        if (dropSprite != null)
        {
            receivingImage.overrideSprite = dropSprite;
            receivingImage.gameObject.SetActive(true);
            Env.isDrop = true;
            if (luafunc != null)
                luafunc.Call(gameObject, Env.DragCardName);
        }
	}

	public void OnPointerEnter(PointerEventData data)
	{
		if (containerImage == null)
			return;

		Sprite dropSprite = GetDropSprite (data);
		if (dropSprite != null)
			containerImage.color = highlightColor;
	}

	public void OnPointerExit(PointerEventData data)
	{
		if (containerImage == null)
			return;
		
		containerImage.color = normalColor;
	}

    private Sprite GetDropSprite(PointerEventData data)
	{
		var originalObj = data.pointerDrag;
		if (originalObj == null)
			return null;

		var srcImage = originalObj.GetComponent<Image>();
		if (srcImage == null)
			return null;
		
		return srcImage.sprite;
	}
}
