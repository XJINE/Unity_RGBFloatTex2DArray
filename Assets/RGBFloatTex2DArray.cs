using UnityEngine;

public class RGBFloatTex2DArray : MonoBehaviour
{
    public Material material;
    public int arrayIndex;

    private void OnGUI()
    {
        GUILayout.BeginArea(new Rect(0, 0, 300, 300));
        arrayIndex = (int)GUILayout.HorizontalSlider(arrayIndex, 0, 2);
        GUILayout.EndArea();
        material.SetInt("_ArrayIndex", arrayIndex);
    }
}
