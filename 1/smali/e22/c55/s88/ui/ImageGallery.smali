.class public Le22/c55/s88/ui/ImageGallery;
.super Landroid/widget/Gallery;


# instance fields
.field private a:Landroid/graphics/Bitmap;

.field private b:Landroid/graphics/Bitmap;

.field private c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Le22/c55/s88/ui/ImageGallery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Le22/c55/s88/ui/ImageGallery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput p2, p0, Le22/c55/s88/ui/ImageGallery;->c:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/widget/Gallery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x2

    iput v0, p0, Le22/c55/s88/ui/ImageGallery;->c:I

    new-instance v0, Le22/c55/s88/ui/b;

    invoke-direct {v0, p0}, Le22/c55/s88/ui/b;-><init>(Le22/c55/s88/ui/ImageGallery;)V

    invoke-virtual {p0, v0}, Le22/c55/s88/ui/ImageGallery;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/ui/ImageGallery;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/ImageGallery;->c:I

    return v0
.end method

.method private a(Landroid/graphics/Canvas;)V
    .locals 11

    const/4 v10, 0x0

    invoke-virtual {p0}, Le22/c55/s88/ui/ImageGallery;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    invoke-interface {v0}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v0, p0, Le22/c55/s88/ui/ImageGallery;->a:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/ui/ImageGallery;->b:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/ui/ImageGallery;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v0, p0, Le22/c55/s88/ui/ImageGallery;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    const/16 v4, 0xa

    invoke-virtual {p0}, Le22/c55/s88/ui/ImageGallery;->getSelectedItemPosition()I

    move-result v5

    invoke-virtual {p0}, Le22/c55/s88/ui/ImageGallery;->getWidth()I

    move-result v1

    mul-int v6, v3, v2

    sub-int/2addr v1, v6

    add-int/lit8 v6, v2, -0x1

    mul-int/2addr v6, v4

    sub-int/2addr v1, v6

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0}, Le22/c55/s88/ui/ImageGallery;->getHeight()I

    move-result v6

    sub-int v0, v6, v0

    sub-int v6, v0, v4

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v2, :cond_1

    if-eq v0, v5, :cond_0

    iget-object v7, p0, Le22/c55/s88/ui/ImageGallery;->a:Landroid/graphics/Bitmap;

    int-to-float v8, v1

    int-to-float v9, v6

    invoke-virtual {p1, v7, v8, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :goto_1
    add-int v7, v3, v4

    add-int/2addr v1, v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v7, p0, Le22/c55/s88/ui/ImageGallery;->b:Landroid/graphics/Bitmap;

    int-to-float v8, v1

    int-to-float v9, v6

    invoke-virtual {p1, v7, v8, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method private a(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;I)V
    .locals 2

    invoke-virtual {p0}, Le22/c55/s88/ui/ImageGallery;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    check-cast v0, Le22/c55/s88/ui/b;

    invoke-virtual {v0}, Le22/c55/s88/ui/b;->a()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p2, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Le22/c55/s88/ui/b;->notifyDataSetChanged()V

    return-void
.end method

.method public a(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2

    const/16 v1, 0xf0

    iput-object p1, p0, Le22/c55/s88/ui/ImageGallery;->a:Landroid/graphics/Bitmap;

    iput-object p2, p0, Le22/c55/s88/ui/ImageGallery;->b:Landroid/graphics/Bitmap;

    iget-object v0, p0, Le22/c55/s88/ui/ImageGallery;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->setDensity(I)V

    iget-object v0, p0, Le22/c55/s88/ui/ImageGallery;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->setDensity(I)V

    return-void
.end method

.method public a(Ljava/util/List;)V
    .locals 1

    invoke-virtual {p0}, Le22/c55/s88/ui/ImageGallery;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    check-cast v0, Le22/c55/s88/ui/b;

    invoke-virtual {v0, p1}, Le22/c55/s88/ui/b;->a(Ljava/util/List;)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/widget/Gallery;->draw(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Le22/c55/s88/ui/ImageGallery;->a(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 2

    invoke-direct {p0, p1, p2}, Le22/c55/s88/ui/ImageGallery;->a(Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x15

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Le22/c55/s88/ui/ImageGallery;->onKeyDown(ILandroid/view/KeyEvent;)Z

    const/4 v0, 0x1

    return v0

    :cond_0
    const/16 v0, 0x16

    goto :goto_0
.end method
