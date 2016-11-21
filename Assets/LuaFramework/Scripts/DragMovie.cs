using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using DG.Tweening;

public class DragMovie : MonoBehaviour {

    private GameObject go;
    private GameObject icon;

    public void Move(GameObject go)
    {
        this.go = go;
        var canvas = FindInParents<Canvas>(gameObject);
        if (canvas == null)
            return;

        icon = new GameObject("icon");

        icon.transform.SetParent(canvas.transform, false);
        icon.transform.SetAsLastSibling();
        icon.transform.position = transform.position;

        var image = icon.AddComponent<Image>();
        CanvasGroup group = icon.AddComponent<CanvasGroup>();
        group.blocksRaycasts = false;

        image.sprite = GetComponent<Image>().sprite;
        image.SetNativeSize();

        GetComponent<Image>().enabled = false;

        icon.transform.DOMove(go.transform.position, 1f).OnComplete(SetImage);
    }

    public void SetImage()
    {
        var image = go.transform.FindChild("Image").GetComponent<Image>();
        image.overrideSprite = GetComponent<Image>().sprite;
        image.gameObject.SetActive(true);
        Destroy(icon);
    }

    private T FindInParents<T>(GameObject go) where T : Component
    {
        if (go == null) return null;
        var comp = go.GetComponent<T>();

        if (comp != null)
            return comp;

        Transform t = go.transform.parent;
        while (t != null && comp == null)
        {
            comp = t.gameObject.GetComponent<T>();
            t = t.parent;
        }
        return comp;
    }
}
