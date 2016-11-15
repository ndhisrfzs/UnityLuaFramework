using UnityEngine;
using System.Collections;
using DG.Tweening;
using UnityEngine.UI;

public class ShowMessage : MonoBehaviour {

	// Use this for initialization
	void Start () {
        transform.GetComponent<CanvasGroup>().DOFade(0, 1.5f);
        transform.DOLocalMoveY(200.0f, 1.5f).SetRelative().OnComplete(DestroySelf);
        //transform.Find("Text").GetComponent<Text>().text = "hahahh";
	}

    private void DestroySelf() {
        Destroy(gameObject);
    }
}
