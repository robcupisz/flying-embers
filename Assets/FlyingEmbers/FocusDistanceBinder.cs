using UnityEngine;
using UnityEngine.VFX;
using UnityEngine.VFX.Utility;

[VFXBinder("FocusDistance")]
public class FocusDistanceBinder : VFXBinderBase
{
    [VFXPropertyBinding("UnityEngine.Vector3")]
    public ExposedProperty FocusDistance;

    public override bool IsValid(VisualEffect component)
    {
        return component.HasFloat(FocusDistance);
    }

    public override void UpdateBinding(VisualEffect component)
    {
#if UNITY_EDITOR
        var view = UnityEditor.SceneView.lastActiveSceneView;
        if (view != null && view.hasFocus)
        {
            component.SetFloat(FocusDistance, -1);
            return;
        }
#endif        
        
        component.SetFloat(FocusDistance, Camera.main.focusDistance);
    }
}