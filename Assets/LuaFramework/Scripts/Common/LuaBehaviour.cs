using UnityEngine;
using LuaInterface;
using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine.UI;

namespace LuaFramework {
    public class LuaBehaviour : View {
        //private string data = null;
        private Dictionary<GameObject, LuaFunction> buttons = new Dictionary<GameObject, LuaFunction>();
        private Dictionary<GameObject, LuaFunction> toggles = new Dictionary<GameObject, LuaFunction>();
        private Dictionary<GameObject, LuaFunction> inputChanges = new Dictionary<GameObject, LuaFunction>();
        private Dictionary<GameObject, LuaFunction> inputEditEnds = new Dictionary<GameObject, LuaFunction>();
        private Dictionary<GameObject, LuaFunction> sliderChanges = new Dictionary<GameObject, LuaFunction>();
        private Dictionary<GameObject, LuaFunction> scrollbarChanges = new Dictionary<GameObject, LuaFunction>();
        private Dictionary<GameObject, LuaFunction> dropdownChanges = new Dictionary<GameObject, LuaFunction>();

        protected void Awake() {
            Util.CallMethod("PanelManager", "Awake", name, gameObject);
        }

        public LuaFunction onStart = null;
        public LuaFunction onUpdate = null;
        public LuaFunction onClick = null;

        protected void Start() {
            if (onStart != null)
                onStart.Call();
        }

        protected void Update() {
            if (onUpdate != null)
                onUpdate.Call();
        }

        protected void OnClick() {
            if (onClick != null)
                onClick.Call();
        }

        protected void OnClickEvent(GameObject go) {
            if (onClick != null)
                onClick.Call(go);
        }

        #region Button
        /// <summary>
        /// 添加单击事件
        /// </summary>
        public void AddButtonClick(GameObject go, LuaFunction luafunc) {
            if (go == null || luafunc == null) return;
            buttons.Add(go, luafunc);
            go.GetComponent<Button>().onClick.AddListener(
                delegate() {
                    luafunc.Call(go);
                }
            );
        }

        /// <summary>
        /// 删除单击事件
        /// </summary>
        /// <param name="go"></param>
        public void RemoveButtonClick(GameObject go) {
            if (go == null) return;
            LuaFunction luafunc = null;
            if (buttons.TryGetValue(go, out luafunc)) {
                luafunc.Dispose();
                luafunc = null;
                buttons.Remove(go);
            }
        }

        /// <summary>
        /// 清除单击事件
        /// </summary>
        public void ClearButtonClick() {
            foreach (var de in buttons) {
                if (de.Value != null) {
                    de.Value.Dispose();
                }
            }
            buttons.Clear();
        }
        #endregion

        #region Toggle
        /// <summary>
        /// 添加Toggle事件
        /// </summary>
        /// <param name="go"></param>
        /// <param name="luafunc"></param>
        public void AddToggleClick(GameObject go, LuaFunction luafunc) {
            if (go == null || luafunc == null) return;
            toggles.Add(go, luafunc);
            go.GetComponent<Toggle>().onValueChanged.AddListener(
                delegate(bool state)
                {
                    luafunc.Call(state, go);
                }
            );
        }

        /// <summary>
        /// 删除Toggle事件
        /// </summary>
        /// <param name="go"></param>
        public void RemoveToggleClick(GameObject go)
        {
            if (go == null) return;
            LuaFunction luafunc = null;
            if (toggles.TryGetValue(go, out luafunc))
            {
                luafunc.Dispose();
                luafunc = null;
                toggles.Remove(go);
            }
        }

        /// <summary>
        /// 清除Toggle事件
        /// </summary>
        public void ClearToggleClick()
        {
            foreach (var de in toggles)
            {
                if (de.Value != null)
                {
                    de.Value.Dispose();
                }
            }
            toggles.Clear();
        }
        #endregion

        #region Input
        /// <summary>
        /// InputChange事件
        /// </summary>
        /// <param name="go"></param>
        /// <param name="luafunc"></param>
        public void AddInputChange(GameObject go, LuaFunction luafunc) {
            if (go == null || luafunc == null) return;
            inputChanges.Add(go, luafunc);
            go.GetComponent<InputField>().onValueChanged.AddListener(
                delegate(string value) {
                    luafunc.Call(value, go);
                }
            );
        }

        /// <summary>
        /// 删除InputChange事件
        /// </summary>
        /// <param name="go"></param>
        public void RemoveInputChange(GameObject go) {
            if (go == null) return;
            LuaFunction luafunc = null;
            if (inputChanges.TryGetValue(go, out luafunc)) {
                luafunc.Dispose();
                luafunc = null;
                inputChanges.Remove(go);
            }
        }

        /// <summary>
        /// 清除InputChange事件
        /// </summary>
        public void ClearInputChange() {
            foreach (var de in inputChanges) {
                if (de.Value != null) {
                    de.Value.Dispose();
                }
            }
            inputChanges.Clear();
        }
        
        /// <summary>
        /// InputEndEdit事件
        /// </summary>
        /// <param name="go"></param>
        /// <param name="luafunc"></param>
        public void AddInputEndEdit(GameObject go, LuaFunction luafunc) {
            if (go == null || luafunc == null) return;
            inputEditEnds.Add(go, luafunc);
            go.GetComponent<InputField>().onEndEdit.AddListener(
                delegate(string value) {
                    luafunc.Call(value, go);
                }
            );
        }
        /// <summary>
        /// 删除InputEndEdit事件
        /// </summary>
        /// <param name="go"></param>
        public void RemoveInputEndEdit(GameObject go)
        {
            if (go == null) return;
            LuaFunction luafunc = null;
            if (inputEditEnds.TryGetValue(go, out luafunc))
            {
                luafunc.Dispose();
                luafunc = null;
                inputEditEnds.Remove(go);
            }
        }

        /// <summary>
        /// 清除InputEndEdit事件
        /// </summary>
        public void ClearInputEndEdit()
        {
            foreach (var de in inputEditEnds)
            {
                if (de.Value != null)
                {
                    de.Value.Dispose();
                }
            }
            inputEditEnds.Clear();
        }
        #endregion

        #region Slider
        /// <summary>
        /// 添加SliderChange事件
        /// </summary>
        public void AddSliderChange(GameObject go, LuaFunction luafunc)
        {
            if (go == null || luafunc == null) return;
            sliderChanges.Add(go, luafunc);
            go.GetComponent<Slider>().onValueChanged.AddListener(
                delegate(Single value)
                {
                    luafunc.Call(value, go);
                }
            );
        }

        /// <summary>
        /// 删除SliderChange事件
        /// </summary>
        /// <param name="go"></param>
        public void RemoveSliderChange(GameObject go)
        {
            if (go == null) return;
            LuaFunction luafunc = null;
            if (sliderChanges.TryGetValue(go, out luafunc))
            {
                luafunc.Dispose();
                luafunc = null;
                sliderChanges.Remove(go);
            }
        }

        /// <summary>
        /// 清除单击事件
        /// </summary>
        public void ClearSliderChange()
        {
            foreach (var de in sliderChanges)
            {
                if (de.Value != null)
                {
                    de.Value.Dispose();
                }
            }
            sliderChanges.Clear();
        }
        #endregion

        #region Scrollbar
        /// <summary>
        /// 添加Scrollbar事件
        /// </summary>
        public void AddScrollbarChange(GameObject go, LuaFunction luafunc)
        {
            if (go == null || luafunc == null) return;
            scrollbarChanges.Add(go, luafunc);
            go.GetComponent<Scrollbar>().onValueChanged.AddListener(
                delegate(Single value)
                {
                    luafunc.Call(value, go);
                }
            );
        }

        /// <summary>
        /// 删除Scrollbar事件
        /// </summary>
        /// <param name="go"></param>
        public void RemoveScrollbarChange(GameObject go)
        {
            if (go == null) return;
            LuaFunction luafunc = null;
            if (scrollbarChanges.TryGetValue(go, out luafunc))
            {
                luafunc.Dispose();
                luafunc = null;
                scrollbarChanges.Remove(go);
            }
        }

        /// <summary>
        /// 清除Scrollbar事件
        /// </summary>
        public void ClearScrollbarChange()
        {
            foreach (var de in scrollbarChanges)
            {
                if (de.Value != null)
                {
                    de.Value.Dispose();
                }
            }
            scrollbarChanges.Clear();
        }
        #endregion

        #region DropDown
        /// <summary>
        /// 添加DropDown事件
        /// </summary>
        public void AddDropdownChange(GameObject go, LuaFunction luafunc)
        {
            if (go == null || luafunc == null) return;
            dropdownChanges.Add(go, luafunc);
            go.GetComponent<Dropdown>().onValueChanged.AddListener(
                delegate(int value)
                {
                    luafunc.Call(value, go);
                }
            );
        }

        /// <summary>
        /// 删除DropDown事件
        /// </summary>
        /// <param name="go"></param>
        public void RemoveDropdownChange(GameObject go)
        {
            if (go == null) return;
            LuaFunction luafunc = null;
            if (dropdownChanges.TryGetValue(go, out luafunc))
            {
                luafunc.Dispose();
                luafunc = null;
                dropdownChanges.Remove(go);
            }
        }

        /// <summary>
        /// 清除DropDown事件
        /// </summary>
        public void ClearDropdownChange()
        {
            foreach (var de in dropdownChanges)
            {
                if (de.Value != null)
                {
                    de.Value.Dispose();
                }
            }
            dropdownChanges.Clear();
        }
        #endregion

        //-----------------------------------------------------------------
        protected void OnDestroy() {
            ClearButtonClick();
            ClearToggleClick();
            ClearInputChange();
            ClearInputEndEdit();
            ClearSliderChange();
            ClearScrollbarChange();
            ClearDropdownChange();
#if ASYNC_MODE
            string abName = name.ToLower();
            ResManager.UnloadAssetBundle(abName + AppConst.ExtName);
#endif
            Util.ClearMemory();
            Debug.Log("~" + name + " was destroy!");
        }
    }
}