.class public Le22/c55/s88/ui/m;
.super Landroid/graphics/drawable/Drawable;


# instance fields
.field private a:Landroid/graphics/drawable/Drawable;

.field private b:Landroid/graphics/drawable/Drawable;

.field private c:Landroid/graphics/drawable/Drawable;

.field private d:I

.field private e:I

.field private f:F


# direct methods
.method public constructor <init>(FLandroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput p1, p0, Le22/c55/s88/ui/m;->f:F

    const/16 v0, 0x2e

    invoke-static {p2, v0}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/ui/m;->a:Landroid/graphics/drawable/Drawable;

    const/16 v0, 0x2d

    invoke-static {p2, v0}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/ui/m;->b:Landroid/graphics/drawable/Drawable;

    const/16 v0, 0x2c

    invoke-static {p2, v0}, Le22/c55/s88/f/b;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/ui/m;->c:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Le22/c55/s88/ui/m;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Le22/c55/s88/ui/m;->d:I

    iget-object v0, p0, Le22/c55/s88/ui/m;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Le22/c55/s88/ui/m;->e:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 9

    const/4 v2, 0x0

    iget v0, p0, Le22/c55/s88/ui/m;->f:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {p0}, Le22/c55/s88/ui/m;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget v0, v5, Landroid/graphics/Rect;->left:I

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    iget-object v4, p0, Le22/c55/s88/ui/m;->c:Landroid/graphics/drawable/Drawable;

    iget v6, v5, Landroid/graphics/Rect;->top:I

    iget v7, p0, Le22/c55/s88/ui/m;->d:I

    add-int/2addr v7, v0

    iget v8, v5, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v4, v0, v6, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v4, p0, Le22/c55/s88/ui/m;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget v4, p0, Le22/c55/s88/ui/m;->d:I

    add-int/2addr v4, v0

    add-int/lit8 v0, v3, 0x1

    move v3, v0

    move v0, v4

    goto :goto_0

    :cond_0
    iget v3, p0, Le22/c55/s88/ui/m;->f:F

    int-to-float v4, v1

    cmpl-float v3, v3, v4

    if-lez v3, :cond_1

    iget-object v3, p0, Le22/c55/s88/ui/m;->b:Landroid/graphics/drawable/Drawable;

    iget v4, v5, Landroid/graphics/Rect;->top:I

    iget v6, p0, Le22/c55/s88/ui/m;->d:I

    add-int/2addr v6, v0

    iget v7, v5, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v3, v0, v4, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v3, p0, Le22/c55/s88/ui/m;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget v3, p0, Le22/c55/s88/ui/m;->d:I

    add-int/2addr v0, v3

    add-int/lit8 v1, v1, 0x1

    :cond_1
    rsub-int/lit8 v3, v1, 0x5

    move v1, v0

    move v0, v2

    :goto_1
    if-ge v0, v3, :cond_2

    iget-object v2, p0, Le22/c55/s88/ui/m;->a:Landroid/graphics/drawable/Drawable;

    iget v4, v5, Landroid/graphics/Rect;->top:I

    iget v6, p0, Le22/c55/s88/ui/m;->d:I

    add-int/2addr v6, v1

    iget v7, v5, Landroid/graphics/Rect;->top:I

    iget-object v8, p0, Le22/c55/s88/ui/m;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v2, v1, v4, v6, v7}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v2, p0, Le22/c55/s88/ui/m;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget v2, p0, Le22/c55/s88/ui/m;->d:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/m;->e:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/m;->d:I

    mul-int/lit8 v0, v0, 0x5

    return v0
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method
