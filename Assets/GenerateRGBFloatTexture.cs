using System.IO;
using UnityEditor;
using UnityEngine;

#if UNITY_EDITOR

public class GenerateRGBFloatTexture : MonoBehaviour
{
    public string     fileName;
    public Vector2Int size;
    public Color      color;

    void Start()
    {
        var tex2D  = new Texture2D(size.x, size.y, TextureFormat.RGBAFloat, false);
        var colors = new Color[size.x * size.y];

        for (var i = 0; i < colors.Length; i++)
        {
            colors[i] = color;
        }

        tex2D.SetPixels(colors);

        var folderPath = Path.Combine("Assets");
        if (AssetDatabase.IsValidFolder(folderPath))
        {
            AssetDatabase.CreateAsset(tex2D, Path.Combine(folderPath, fileName + ".asset"));
        }
    }
}

#endif