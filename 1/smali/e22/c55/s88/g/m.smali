.class public Le22/c55/s88/g/m;
.super Landroid/widget/LinearLayout;


# instance fields
.field private a:Landroid/widget/ImageButton;

.field private b:Landroid/content/Context;

.field private c:Le22/c55/s88/g/o;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, -0x1

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-object v0, p0, Le22/c55/s88/g/m;->c:Le22/c55/s88/g/o;

    iput-object p1, p0, Le22/c55/s88/g/m;->b:Landroid/content/Context;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Le22/c55/s88/g/m;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/g/m;)Le22/c55/s88/g/o;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/m;->c:Le22/c55/s88/g/o;

    return-object v0
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;I)V
    .locals 2

    invoke-virtual {p0, p2}, Le22/c55/s88/g/m;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iget-object v1, p0, Le22/c55/s88/g/m;->b:Landroid/content/Context;

    invoke-static {v1, p1}, Le22/c55/s88/f/b;->a(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public a(Le22/c55/s88/g/o;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/m;->c:Le22/c55/s88/g/o;

    return-void
.end method

.method public a(Ljava/util/List;)V
    .locals 7

    const/4 v6, 0x3

    const/4 v2, 0x0

    move v1, v2

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    new-instance v0, Landroid/widget/ImageButton;

    iget-object v3, p0, Le22/c55/s88/g/m;->b:Landroid/content/Context;

    invoke-direct {v0, v3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/g/m;->a:Landroid/widget/ImageButton;

    iget-object v3, p0, Le22/c55/s88/g/m;->a:Landroid/widget/ImageButton;

    iget-object v4, p0, Le22/c55/s88/g/m;->b:Landroid/content/Context;

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-static {v4, v0}, Le22/c55/s88/f/b;->a(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/ImageButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Le22/c55/s88/g/m;->a:Landroid/widget/ImageButton;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-direct {v3, v4, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iget-object v0, p0, Le22/c55/s88/g/m;->b:Landroid/content/Context;

    invoke-static {v0, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v0

    iput v0, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    iput v0, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    iput v0, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iput v0, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    iget-object v0, p0, Le22/c55/s88/g/m;->b:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/f/a;->n(Landroid/content/Context;)I

    move-result v0

    iget-object v4, p0, Le22/c55/s88/g/m;->b:Landroid/content/Context;

    invoke-static {v4, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x4

    sub-int/2addr v0, v4

    div-int/lit8 v4, v0, 0x2

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    mul-int/2addr v0, v4

    div-int/2addr v0, v5

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v0, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iget-object v0, p0, Le22/c55/s88/g/m;->a:Landroid/widget/ImageButton;

    invoke-virtual {p0, v0, v3}, Le22/c55/s88/g/m;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le22/c55/s88/g/m;->a:Landroid/widget/ImageButton;

    new-instance v3, Le22/c55/s88/g/n;

    invoke-direct {v3, p0}, Le22/c55/s88/g/n;-><init>(Le22/c55/s88/g/m;)V

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_0

    :cond_1
    return-void
.end method
