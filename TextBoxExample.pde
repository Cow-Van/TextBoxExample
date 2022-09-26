TextBox tb;

void setup() {
  size(500, 500);
  
  tb = new TextBox(250, 250, 50, 50, color(255, 255, 255), color(0, 0, 0));
  tb.addChar(0, 'a');
  tb.addChar(1, 'b');
  tb.addChar(2, 'c');
}

void draw() {
  tb.update();
}

public class TextBox {
  private final ArrayList<Character> chars = new ArrayList();
  
  private float x;
  private float y;
  private float w;
  private float h;
  private color txtColor;
  private color bgColor;
  
  public TextBox(float tbX, float tbY, float tbWidth, float tbHeight, color tbTextColor, color tbBackgroundColor) {
    x = tbX; // X-coordinate of the top left
    y = tbY; // Y-coordinate of the top left
    w = tbWidth; // Width
    h = tbHeight; // Height
    txtColor = tbTextColor; // Text color
    bgColor = tbBackgroundColor; // Text box background color
  }
  
  public void update() {
    fill(bgColor);
    rect(x, y, w, h);
    // ISSUE
    text(characterListToString(chars), x, y);
  }
  
  // Adds char at given index (Note: current char at the `index` will now be at `index + 1`)
  public void addChar(int index, char character) {
    chars.add(index, character);
  }
  
  // Removes char at given index (Note: current char at `index + 1` will now be at `index`)
  public void removeChar(int index) {
    chars.remove(index);
  }
  
  // Converts list of chars to string
  private String characterListToString(ArrayList<Character> characterList) {
    String s = "";
    
    for (Character c : characterList) {
      s += c;
    }
    
    return s;
  }
}
