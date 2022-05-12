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

!

l1 = (3,null);
l1 = (2,l1);
l1 = (1,l1);
l2 = (5,null);
l2 = (4,l2);
l3 = (3,l2);
l3 = (2,l3);
l3 = (1,l3);
