#ifndef EXPRESSION
#define EXPRESSION

class Expression {
public:
  virtual ~Expression () {}

  //  It's necessary because we need to clone objects without
  // knowing the exact type.
  virtual Expression* clone() const  = 0;

  // The value represented by the expression
  virtual int value () = 0;
};

// For addictive expressions
class Plus : public Expression {
  Expression *m_left, *m_right;

public:

  Plus (Expression *left, Expression *right): m_left (left), m_right (right) {}

  // Copy constructor
  Plus (const Plus &other) {
    m_left = other.m_left->clone ();
    m_right = other.m_right->clone ();
  }

  virtual ~Plus ()
  {
    delete m_left;
    delete m_right;
  }

  Plus &operator = (const Plus &other) {
    if (&other != this) {
      delete m_left;
      delete m_right;
      m_left = other.m_left->clone ();
      m_right = other.m_right->clone ();
    }
    return *this;
  }


  virtual Plus* clone() const { return new Plus (*this); }

  virtual int value () { return m_left->value () + m_right->value (); }

};


// For numbers
class Number : public Expression {
  int m_val;

public:

  Number (int val): m_val (val) {}

  // Copy constructor
  Number (const Number &other) { m_val = other.m_val; }

  Number &operator = (const Number &other) {
    if (&other != this){
      m_val = other.m_val;
      }
    return *this;
  }

  virtual Number *clone() const { return new Number (*this); }

  virtual int value () { return m_val; }
};



#endif
