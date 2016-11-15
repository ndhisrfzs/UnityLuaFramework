using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using DG.Tweening;

public class MoveAnimation : MonoBehaviour {
    public RectTransform manRectTransform;
    public RectTransform womanRectTransform;
    public Button manButton;
    public Button womanButton;
    private bool isForward = false;

	void Start () {
        Tweener tweener_man = manRectTransform.DOScale(1.0f, 0.3f);
        tweener_man.SetAutoKill(false);
        tweener_man.Pause();
        Sequence sequence1 = DOTween.Sequence();
        sequence1.Append(manRectTransform.DOLocalMoveX(-100.0f, 0.3f).SetRelative().OnComplete(SetIndex));
        sequence1.Append(manRectTransform.DOLocalMoveX(100.0f, 0.3f).SetRelative().OnRewind(SetIndex));
        sequence1.SetAutoKill(false);
        sequence1.Pause();
        sequence1.SetId("sequence1");

        Tweener tweener_woman = womanRectTransform.DOScale(0.5f, 0.3f);
        tweener_woman.SetAutoKill(false);
        tweener_woman.Pause();
        Sequence sequence2 = DOTween.Sequence();
        sequence2.Append(womanRectTransform.DOLocalMoveX(100.0f, 0.3f).SetRelative());
        sequence2.Append(womanRectTransform.DOLocalMoveX(-100.0f, 0.3f).SetRelative());
        sequence2.SetAutoKill(false);
        sequence2.Pause();
        sequence2.SetId("sequence2");
	}

    public void SetIndex()
    {
        if (!isForward)
        {
            manRectTransform.SetSiblingIndex(1);
            womanRectTransform.SetSiblingIndex(-1);
        }
        else
        {
            manRectTransform.SetSiblingIndex(-1);
            womanRectTransform.SetSiblingIndex(1);
        }
    }

    public void OnClick()
    {
        if (!isForward)
        {
            manRectTransform.DOPlayForward();
            womanRectTransform.DOPlayForward();
            DOTween.PlayForward("sequence1");
            DOTween.PlayForward("sequence2");
            manButton.interactable = false;
            womanButton.interactable = true;
            isForward = true;
        }
        else
        {
            manRectTransform.DOPlayBackwards();
            womanRectTransform.DOPlayBackwards();
            DOTween.PlayBackwards("sequence1");
            DOTween.PlayBackwards("sequence2");
            manButton.interactable = true;
            womanButton.interactable = false;
            isForward = false;
        }
    }
}
