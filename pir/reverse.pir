-- append lists l1 and l2.  The empty list is
-- represented as null, and cons'ing h onto t
-- is represented by the pair (h,t).
app(l1,l2) {
  if null?(l1) {
    return l2;
  } else {
    h = l1.1;
    l1 = l1.2;
    x = app(l1,l2);
    return (h,x);
  }
}

-- have the second input as a list that holds the reversed list
rev(l1,l2) {
  if null?(l1.2) {
    return l1.1;
  } else {
    h = l1.1;
    l1 = l1.2;
    x = rev(l1,l2);
    f = app(h,x);
    return f;
  }
}

!

l1 = (3,#);
l1 = (2,l1);
l1 = (1,l1);
l2 = (1,#);
l2 = (2,l2);
l2 = (3,l2);

!

rev(l1,#) = l2