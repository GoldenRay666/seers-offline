.class Le22/c55/s88/a/c;
.super Landroid/widget/FrameLayout;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private a:Landroid/widget/LinearLayout;

.field private b:Landroid/widget/LinearLayout;

.field private c:Landroid/widget/ImageView;

.field private d:Landroid/widget/TextView;

.field private e:Landroid/widget/TextView;

.field private f:Landroid/widget/Button;

.field private g:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 9

    const/4 v8, -0x1

    const/4 v5, 0x1

    const/4 v7, 0x0

    const/16 v6, 0xa

    const/4 v4, -0x2

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/a/c;->a:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/a/c;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Le22/c55/s88/a/c;->a:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0, v8, v8}, Le22/c55/s88/a/c;->addView(Landroid/view/View;II)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x10

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le22/c55/s88/a/c;->c:Landroid/widget/ImageView;

    iget-object v1, p0, Le22/c55/s88/a/c;->a:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/a/c;->c:Landroid/widget/ImageView;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/a/c;->b:Landroid/widget/LinearLayout;

    iget-object v0, p0, Le22/c55/s88/a/c;->b:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0x10

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iget-object v1, p0, Le22/c55/s88/a/c;->a:Landroid/widget/LinearLayout;

    iget-object v2, p0, Le22/c55/s88/a/c;->b:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/a/c;->d:Landroid/widget/TextView;

    iget-object v0, p0, Le22/c55/s88/a/c;->d:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v0, p0, Le22/c55/s88/a/c;->d:Landroid/widget/TextView;

    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v0, p0, Le22/c55/s88/a/c;->d:Landroid/widget/TextView;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Le22/c55/s88/a/c;->b:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le22/c55/s88/a/c;->d:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v4, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/a/c;->e:Landroid/widget/TextView;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iget-object v0, p0, Le22/c55/s88/a/c;->e:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    iget-object v0, p0, Le22/c55/s88/a/c;->e:Landroid/widget/TextView;

    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v0, p0, Le22/c55/s88/a/c;->e:Landroid/widget/TextView;

    const v1, -0x777778

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Le22/c55/s88/a/c;->b:Landroid/widget/LinearLayout;

    iget-object v1, p0, Le22/c55/s88/a/c;->e:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v4, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;II)V

    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-array v1, v5, [I

    const v2, 0x10100a7

    aput v2, v1, v7

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const v3, -0xff4f18

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v1, v5, [I

    const v2, 0x101009e

    aput v2, v1, v7

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const v3, -0xf0f10

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Le22/c55/s88/a/c;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    new-array v1, v5, [I

    const v2, 0x10100a7

    aput v2, v1, v7

    const/16 v2, 0x1d

    invoke-static {p1, v2}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-array v1, v5, [I

    const v2, 0x101009e

    aput v2, v1, v7

    const/16 v2, 0x1c

    invoke-static {p1, v2}, Le22/c55/s88/f/b;->d(Landroid/content/Context;I)Landroid/graphics/drawable/NinePatchDrawable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x15

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v2

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    iget-object v2, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v5

    invoke-static {p1, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/widget/Button;->setPadding(IIII)V

    iget-object v2, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    invoke-virtual {v2, v0}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    const-string v2, "\u4e0b\u8f7d"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setTextColor(I)V

    iget-object v0, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setFocusable(Z)V

    iget-object v0, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    invoke-virtual {p0, v0, v1}, Le22/c55/s88/a/c;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/c;->c:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public a(Landroid/view/View$OnClickListener;I)V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/a/c;->f:Landroid/widget/Button;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    iput-object p1, p0, Le22/c55/s88/a/c;->g:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/c;->d:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/c;->e:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/a/c;->g:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/a/c;->g:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method
