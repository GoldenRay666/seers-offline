.class public Le22/c55/s88/g/x;
.super Landroid/widget/LinearLayout;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private a:Landroid/widget/ImageView;

.field private b:Landroid/widget/TextView;

.field private c:Landroid/widget/ImageView;

.field private d:Landroid/widget/TextView;

.field private e:Landroid/view/View$OnClickListener;

.field private f:Landroid/graphics/drawable/Drawable;

.field private g:Landroid/content/Context;

.field private h:I

.field private i:Landroid/widget/LinearLayout;

.field private j:Landroid/widget/Button;

.field private k:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 11

    const/4 v4, 0x1

    const/16 v10, 0xa

    const/4 v9, -0x1

    const/4 v8, 0x0

    const/4 v7, -0x2

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/x;->i:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/g/x;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Le22/c55/s88/g/x;->i:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0, v9, v9}, Le22/c55/s88/g/x;->addView(Landroid/view/View;II)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/x;->k:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/g/x;->k:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0, v8, v1, v8, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v1, p0, Le22/c55/s88/g/x;->i:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/g/x;->k:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object p1, p0, Le22/c55/s88/g/x;->g:Landroid/content/Context;

    const/4 v0, 0x6

    invoke-static {p1, v0}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v0

    const/4 v1, 0x6

    invoke-static {p1, v1}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, 0x6

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, 0x6

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Le22/c55/s88/g/x;->setPadding(IIII)V

    const/16 v0, 0x10

    invoke-static {p1, v0}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/g/x;->f:Landroid/graphics/drawable/Drawable;

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/x;->a:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/g/x;->a:Landroid/widget/ImageView;

    iget-object v2, p0, Le22/c55/s88/g/x;->f:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x37

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0x37

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x11

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Le22/c55/s88/g/x;->a:Landroid/widget/ImageView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/x;->c:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/g/x;->c:Landroid/widget/ImageView;

    const/16 v2, 0x11

    invoke-static {p1, v2}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x12

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0x12

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x35

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Le22/c55/s88/g/x;->c:Landroid/widget/ImageView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Le22/c55/s88/g/x;->c:Landroid/widget/ImageView;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x11

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Le22/c55/s88/g/x;->k:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1, v8, v8, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v3, 0x5

    invoke-static {p1, v3}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/x;->b:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/g/x;->b:Landroid/widget/TextView;

    const/high16 v3, -0x1000000

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/g/x;->b:Landroid/widget/TextView;

    const/high16 v3, 0x41800000    # 16.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/g/x;->b:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v3, p0, Le22/c55/s88/g/x;->b:Landroid/widget/TextView;

    invoke-virtual {v2, v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Le22/c55/s88/g/x;->g:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/g/x;->d:Landroid/widget/TextView;

    iget-object v1, p0, Le22/c55/s88/g/x;->d:Landroid/widget/TextView;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/g/x;->d:Landroid/widget/TextView;

    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Le22/c55/s88/g/x;->d:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v1, p0, Le22/c55/s88/g/x;->d:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x5

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v2, p0, Le22/c55/s88/g/x;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    const/16 v2, 0x11

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Le22/c55/s88/g/x;->k:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x11

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Le22/c55/s88/g/x;->k:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-array v2, v4, [I

    const v3, 0x10100a7

    aput v3, v2, v8

    const/16 v3, 0x33

    invoke-static {p1, v3}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v2, v4, [I

    const v3, 0x101009e

    aput v3, v2, v8

    const/16 v3, 0x32

    invoke-static {p1, v3}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    iget-object v2, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/Button;->setPadding(IIII)V

    iget-object v2, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    sget-object v2, Le22/c55/s88/f/e;->p:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    invoke-virtual {v1, v8}, Landroid/widget/Button;->setFocusable(Z)V

    iget-object v1, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    invoke-virtual {v1, v9}, Landroid/widget/Button;->setTextColor(I)V

    iget-object v1, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    const/16 v2, 0xf

    invoke-static {p1, v2}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    const/16 v4, 0xf

    invoke-static {p1, v4}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p1, v10}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/Button;->setPadding(IIII)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/4 v2, 0x5

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    invoke-virtual {v0, v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x2

    invoke-direct {v1, v9, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Le22/c55/s88/g/x;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const v1, -0x282422

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x2

    invoke-direct {v1, v9, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Le22/c55/s88/g/x;->i:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    return-void
.end method

.method public a(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/x;->a:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public a(Landroid/view/View$OnClickListener;I)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/x;->j:Landroid/widget/Button;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    iput-object p1, p0, Le22/c55/s88/g/x;->e:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/x;->b:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public a(Z)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/x;->c:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/g/x;->c:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method

.method public b(I)V
    .locals 0

    iput p1, p0, Le22/c55/s88/g/x;->h:I

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/x;->d:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public c(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/x;->e:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/g/x;->e:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method
